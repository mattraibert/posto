### List Commands

`init`: create a 'posto.md' file in the working directory.

`list`, `todos`, `[default]`: display the todo list.

`sort`: sort the unsorted todos by asking the user a series of questions about priorities.

`resort`: remove any existing sort order and then sort again (this can be time consuming).


### Single Todo Commands

`add '<task>'`: add <task> unsorted to the bottom of the todo list.

`start '<task>'`: add, sort and commit with a message based on <task>.

`done [n]`, `delete [n]`: remove the nth todo from the list; n is the top todo by default.

`commit [n]`: remove the nth todo and commit with a message based on the task description.

`do [n]`, `top [n]`: displays the top todo; or, if n is provided, move the nth todo to the top.

`unsort [n]`: unsort the nth todo and place it at the bottom; n is the top todo by default.
