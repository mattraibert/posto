module Posto
  module Help
    class << self
      def help_text
        format(parse(read))
      end

      def read
        lines = ::File.read("#{::File.dirname(__FILE__)}/help.md").lines
        lines.map { |line| line.chomp }.reject(&:empty?).map { |line| line.gsub /(### |`)/, "" }
      end

      def parse(md_file)
        md_file.map { |x| x.split(": ") }.inject({}) do |memo, o|
          memo[:title] = o.first if o.size == 1
          memo[memo[:title]] ||= {}
          memo[memo[:title]][o.first]= o.last if o.size == 2
          memo
        end
      end

      def format(hash)
        hash.delete(:title)
        hash.map { |title, commands| format_list(commands, title) }.join("\n")
      end

      def format_list(commands, title)
        "\n#{title}:\n#{format_commands(commands)}"
      end

      def format_commands(commands)
        commands.map do |command, definition|
          format_command_definition(command, definition)
        end.join("\n")
      end

      def format_command_definition(command, definition)
        aliases = command.split(', ')
        command = aliases.first
        aliases = aliases[1..-1]
        (["#{format_command command}#{definition}"] +
            aliases.map { |command_alias| format_alias(command_alias, command) }).join("\n")
      end

      def format_alias(command_alias, alias_for)
        "#{format_command command_alias}alias for '#{alias_for}'"
      end

      def format_command(command_alias)
        ' ' * 3 + command_alias.ljust(15)
      end
    end
  end
end