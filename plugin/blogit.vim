" Copyright (C) 2009 Romain Bignon
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, version 3 of the License.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program; if not, write to the Free Software
" Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
"
" Maintainer:   Romain Bignon
" URL:          http://symlink.me/wiki/blogit
" Version:      1.0.1
" Last Change:  2009 April 11
"
" Commands :
" ":Blogit ls"
"   Lists all articles in the blog
" ":Blogit new"
"   Opens page to write new article
" ":Blogit edit <id>"
"   Opens the article <id> for edition
" ":Blogit commit"
"   Saves the article to the blog
" ":Blogit push"
"   Publish article
" ":Blogit unpush"
"   Unpublish article
" ":Blogit rm <id>"
"   Remove an article
" ":Blogit categories"
"   Show categories list
" ":Blogit help"
"   Display help
"
" Configuration :
"   Edit the "Settings" section
"
" Usage :
"   Just fill in the blanks, do not modify the highlighted parts and everything
"   should be ok.
"
" vim: set et softtabstop=4 cinoptions=4 shiftwidth=4 ts=4 ai

command! -nargs=+ Blogit exec('py blogit.command(<f-args>)')

python <<EOF
# -*- coding: utf-8 -*-
import vim, xmlrpclib, sys, re, time, datetime
from xmlrpclib import DateTime, Fault
from types import MethodType

#####################
#      Settings     #
#####################

blog_username = 'admin'
blog_password = 'Wqgipvbkcg8827'
blog_url = 'http://www.zilongshanren.com/xmlrpc.php'
# enabled if blog has the tag plugin:
have_tags = True

#####################
# Do not edit below #
#####################

class BlogIt:

    def __init__(self):
        self.client = xmlrpclib.ServerProxy(blog_url)
        self.current_post = None
        self.haveTags = have_tags

    def command(self, command, *args):
        commands = self.getMethods('command_')
        if not command in commands:
            sys.stderr.write("No such command: %s" % command)
        try:
            commands[command](*args)
        except TypeError, e:
            try:
                sys.stderr.write("Command %s takes %s arguments" % (command, int(str(e).split(' ')[3]) - 1))
            except:
                sys.stderr.write('%s' % e)

    def command_help(self):
        sys.stdout.write("Available commands:\n")
        sys.stdout.write("   Blogit ls              list all posts\n")
        sys.stdout.write("   Blogit new             create a new post\n")
        sys.stdout.write("   Blogit edit <id>       edit a post\n")
        sys.stdout.write("   Blogit commit          commit current post\n")
        sys.stdout.write("   Blogit push            publish post\n")
        sys.stdout.write("   Blogit unpush          unpublish post\n")
        sys.stdout.write("   Blogit rm <id>         remove a post\n")
        sys.stdout.write("   Blogit categories      list categories\n")
        sys.stdout.write("   Blogit help            display this notice\n")

    def command_ls(self):
        try:
            allposts = self.client.metaWeblog.getRecentPosts('',blog_username, blog_password)
            if not allposts:
                sys.stderr.write("There isn't any post")
                return

            formatter = '%%%dd\t%%s\t%%s' % len(allposts[0]['postid'])
            del vim.current.buffer[:]
            vim.command("set syntax=blogsyntax")
            self.current_post = None
            vim.current.buffer[0] = "ID\tDate             \tTitle"
            for p in allposts:
                vim.current.buffer.append(formatter % (int(p['postid']), p['date_created_gmt'], p['title'].encode('utf-8')))
                vim.command('set nomodified')
            vim.current.window.cursor = (2, 0)
            vim.command('map <enter> :py blogit.list_edit()<cr>')
        except Exception, err:
            sys.stderr.write("An error has occured: %s" % err)

    def list_edit(self):
        row,col = vim.current.window.cursor
        id = vim.current.buffer[row-1].split()[0]
        self.command('edit', int(id))

    def command_edit(self, id):
        try:
            id = int(id)
        except ValueError:
            sys.stderr.write("'id' must be an integer value.")
            return

        try:
            post = self.client.metaWeblog.getPost(id, blog_username, blog_password)
            self.display_post(post)
        except Fault, e:
            sys.stderr.write(e.faultString)

    def command_new(self):
        username = self.client.blogger.getUserInfo('', blog_username, blog_password)['firstname']
        self.display_post({'wp_author_display_name': username,
                           'postid': '',
                           'title': '',
                           'wp_slug': '',
                           'categories': '',
                           'mt_keywords': '',
                           'date_created_gmt': '',
                           'description': '',
                           'mt_text_more': '',
                           'post_status': 'draft',
                           })

    def display_post(self, post):
        vim.command("set ft=rst")
        del vim.current.buffer[:]
        vim.current.buffer[0] = 'From: %s' % post['wp_author_display_name'].encode('utf-8')
        vim.current.buffer.append('Post-Id: %s' % post['postid'])
        vim.current.buffer.append('Subject: %s' % post['title'].encode('utf-8'))
        vim.current.buffer.append('Slug: %s' % post['wp_slug'].encode('utf-8'))
        vim.current.buffer.append('Categories: %s' % ",".join(post["categories"]).encode("utf-8"))
        if self.haveTags:
            vim.current.buffer.append('Tags: %s' % post["mt_keywords"].encode("utf-8"))
        vim.current.buffer.append('Date: %s' % post['date_created_gmt'])
        vim.current.buffer.append('')
        content = post["description"].encode("utf-8")
        content_more = post["mt_text_more"].encode("utf-8")
        if content_more:
          content = content + "<!--more-->" + content_more
        for line in content.split('\n'):
            vim.current.buffer.append(line)

        vim.current.window.cursor = (8, 0)
        vim.command('set nomodified')
        vim.command('set textwidth=0')
        self.current_post = post

    def getMeta(self, name):
        n = self.getLine(name)
        if not n:
            return ''

        r = re.compile('^%s: (.*)' % name)
        m = r.match(vim.current.buffer[n])
        if m:
            return m.group(1)

        return ''

    def getLine(self, name):
        r = re.compile('^%s: (.*)' % name)
        for n, line in enumerate(vim.current.buffer):
            if line == '':
                return 0
            m = r.match(line)
            if m:
                return n

        return 0

    def command_commit(self):
        if self.current_post is None:
            sys.stderr.write("Not editing any post.")
            return

        push = 0
        if self.current_post['post_status'] == 'publish':
            push = 1
        self.sendArticle(push=push)

    def command_push(self):
        if self.current_post is None:
            sys.stderr.write("Not editing any post.")
            return
        self.sendArticle(push=1)

    def command_unpush(self):
        if self.current_post is None:
            sys.stderr.write("Not editing any post.")
            return
        self.sendArticle(push=0)

    def nowstr(self):
        return time.strftime('%Y%m%dT%H:%M:%S', time.localtime(time.mktime(datetime.datetime.utcnow().timetuple())))

    def sendArticle(self, push=0):
        try:
            vim.command('set nomodified')
            start_text = 0
            for line in vim.current.buffer:
                start_text += 1
                if line == '':
                    break

            post = self.current_post
            post['title'] = self.getMeta('Subject')
            post['wp_slug'] = self.getMeta('Slug')
            post['wp_author_display_name'] = self.getMeta('From')
            post['categories'] = self.getMeta('Categories').split(',')
            if self.haveTags:
                post['mt_keywords'] = self.getMeta('Tags')
            post['description'] = '\n'.join(vim.current.buffer[start_text:])
            post['mt_text_more'] = ''

            datetime = self.getMeta('Date')
            if datetime != '' and (self.current_post['post_status'] != 'draft' or \
                                   DateTime(datetime) > DateTime(self.nowstr())):
                post['date_created_gmt'] = DateTime(datetime)
            else:
                post['date_created_gmt'] = DateTime(self.nowstr())

            if push:
                post['post_status'] = 'publish'
            else:
                post['post_status'] = 'draft'

            strid = self.getMeta('Post-Id')

            if strid == '':
                strid = self.client.metaWeblog.newPost('', blog_username,
                                                       blog_password, post, push)
            else:
                self.client.metaWeblog.editPost(strid, blog_username,
                                                blog_password, post, push)

            self.display_post(self.client.metaWeblog.getPost(strid, blog_username, blog_password))
        except Fault, e:
            sys.stderr.write(e.faultString)

    def command_rm(self, id):
        try:
            id = int(id)
        except ValueError:
            sys.stderr.write("'id' must be an integer value.")
            return

        try:
            self.client.metaWeblog.deletePost('', id, blog_username, blog_password)
        except Fault, e:
            sys.stderr.write(e.faultString)
            return
        sys.stdout.write('Article removed')
        if self.current_post and int(self.current_post['postid']) == int(id):
            del vim.current.buffer[:]
            self.current_post = None

    def command_categories(self):
        cats = self.client.wp.getCategories('', blog_username, blog_password)
        sys.stdout.write('Categories:\n')
        for cat in cats:
            sys.stdout.write('  %s\n' % cat['categoryName'])

    def getMethods(self, prefix):
        services = {}
        for attrname in dir(self):
            if not attrname.startswith(prefix):
                continue
            attr = getattr(self, attrname)
            if not isinstance(attr, MethodType):
                continue
            name = attrname[len(prefix):]
            services[name] = attr
        return services

blogit = BlogIt()
