require 'test_helper'
require 'posto/help'

class HelpTest < MiniTest::Unit::TestCase
  def test_command_without_aliases
    assert_equal "   init           create a 'posto.md' file in the working directory.",
                 Posto::Help.format_command_definition("init", "create a 'posto.md' file in the working directory.")
  end

  def test_command_with_aliases
    expected = <<EOF.chomp
   list           display the todo list.
   todos          alias for 'list'
   [default]      alias for 'list'
EOF
    assert_equal expected, Posto::Help.format_command_definition("list, todos, [default]", "display the todo list.")
  end

  def test_help
    help_text = <<EOF.chomp

List Commands:
   init           create a 'posto.md' file in the working directory.
   list           display the todo list.
   todos          alias for 'list'
   [default]      alias for 'list'
   sort           sort the unsorted todos by asking the user a series of questions about priorities.
   resort         remove any existing sort order and then sort again (this can be time consuming).

Single Todo Commands:
   add '<task>'   add <task> unsorted to the bottom of the todo list.
   start '<task>' add, sort and commit with a message based on <task>.
   done [n]       remove the nth todo from the list; n is the top todo by default.
   delete [n]     alias for 'done [n]'
   commit [n]     remove the nth todo and commit with a message based on the task description.
   do [n]         displays the top todo; or, if n is provided, move the nth todo to the top.
   top [n]        alias for 'do [n]'
   unsort [n]     unsort the nth todo and place it at the bottom; n is the top todo by default.
EOF
    assert_equal(help_text, Posto::Help.help_text)
  end
end

  