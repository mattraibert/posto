require 'test_helper'
require 'posto/help'

class HelpTest < MiniTest::Unit::TestCase
  def test_command_without_aliases
    assert_equal "   init              create a 'posto.md' file in the working directory.",
                 Posto::Help.format_command_definition("init", "create a 'posto.md' file in the working directory.")
  end

  def test_command_with_aliases
    expected = <<EOF.chomp
   list              display the todo list.
   todos             alias for 'list'
   [default]         alias for 'list'
EOF
    assert_equal expected, Posto::Help.format_command_definition("list, todos, [default]", "display the todo list.")
  end

  def test_help
    help_text = <<EOF.chomp

List Commands:
   init              create a 'posto.md' file in the working directory.
   list              display the todo list.
   todos             alias for 'list'
   [default]         alias for 'list'
   sort              ask the user about priorities to sort todos.
   resort            reset sort order and sort again (can be time consuming).

Single Todo Commands:
   add '<todo>'      add <todo> unsorted to the bottom of the todo list.
   schedule '<todo>' add and commit with a message based on <todo>.
   done [n = 1]      remove the nth todo from the list.
   delete [n]        alias for 'done [n = 1]'
   commit [n = 1]    remove the nth todo; commit with a relevant message.
   do                displays the top todo.
   top               alias for 'do'
   do [n]            move the nth todo to the top.
   top [n]           alias for 'do [n]'
   unsort [n]        unsort the nth todo and place it at the bottom.
EOF
    assert_equal(help_text, Posto::Help.help_text)
  end
end

  