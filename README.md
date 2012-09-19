# Posto

Sort your todo list from the command line.

## Tutorial

After adding `gem "posto"` to your Gemfile, `bundle install`

To initialize a posto file, `posto init` 

To add a task, `posto add "an example task"`

To see current tasks, `posto`

### List Commands

`init`: create a 'posto.md' file in the current directory.

`[default]`, `todos`, `list`: display the todo list.

`sort`: sort the unsorted todos by asking the user a series of questions about priorities.

`resort`: remove any existing sort order and then sort again (this can be time consuming).


### Single Todo Commands

`add "<task description>"`: add <task description> unsorted to the bottom of the todo list.

`start "<task description>"`: add, sort and commit with a message based on the task description.

`done [n]`, `delete [n]`: remove the nth todo from the list; n is the top todo by default.

`commit [n]`: remove the nth todo and commit with a message based on the task description.

`do [n]`, `top [n]`: displays the top todo; or, if n is provided, move the nth todo to the top.

`unsort [n]`: unsort the nth todo and place it at the bottom; n is the top todo by default.


## Naming

Posto is named for [Del Posto](http://www.delposto.com/) in New York City -- a restaurant that has been on my todo list for quite a while.

## Copyright

Copyright (c) 2012 Matt Raibert.
Grasshopper is available under the GPL v3 see LICENSE.txt for further details.
