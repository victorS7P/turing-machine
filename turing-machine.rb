require 'json'
require 'rainbow'

class TuringMachine
  def initialize (json_path, should_print = false, blank_key = "_")
    # set the blank key
    @blank_key = blank_key

    # init at first cell
    @current_cell = 0

    # load program from json file
    @program = JSON.parse(File.read(json_path))

    # set initial state
    @current_state = 0

    # set final satate index
    @final_state = @program.length - 1

    # set if the process will be printed
    @should_print = should_print
  end

  def print_tape (tape, indicator = true)
    # print tape underlining the current cell
    tape.sort{|c|
      c[0].to_i
    }.to_h.map{|c|
      if (c[0].to_i == @current_cell and indicator)
        print Rainbow(c[1]).underline
      else
        print c[1]
      end
    }
  end

  def get_current_symbol (tape)
    # get symbol of current cell
    tape[@current_cell.to_s] or @blank_key
  end

  def move_right
    @current_cell += 1
  end

  def move_left
    @current_cell -= 1
  end

  def run (input)
    # create a tape sa a Hash from input
    tape = Hash.new
    input.split("").each_with_index do |value, i|
      tape[i.to_s] = value
    end

    if (@should_print)
      puts "Fita inicial:"
      self.print_tape tape, false
      puts "\n\n"
    end

    while @current_state != @final_state do
      # get current state commands
      state = @program[@current_state]
      
      # get current symbol in cell
      symbol = self.get_current_symbol tape

      # get transition info for that symbol in that state
      transition = state.find { |s| s["read"] == symbol }

      if (@should_print)
        puts "FITA"
        self.print_tape tape
        puts "\n\n"

        puts "ESTADO"
        puts "Estado atual: #{@current_state}"
        puts "Símbolo lido: #{symbol}"
        puts "\n" if @should_print

        puts "TRANSIÇÃO"
        puts "Símbolo a ser escrito: #{transition["write"]}"
        puts "Próximo estado       : #{transition["next_state"]}"
        puts "Direção de movimento : #{if transition["direction"] == "R" then "direita" else "esquerda" end}"
        puts "\n"
      end

      tape[@current_cell.to_s] = transition["write"]
      @current_state = transition["next_state"].to_i

      # move tape header
      if transition["direction"] == "R" then self.move_right else self.move_left end
    end

    without_blanks = tape.to_a.filter {|c| c [1] != @blank_key}.to_h
    if @should_print
      puts "FITA FINAL"
      print "Com súmbolos brancos: "
      self.print_tape tape, false
      puts "\n"
      print "Sem símbolos brancos: "
      self.print_tape without_blanks, false
      puts "\n"
    end

    without_blanks.to_a.map{|c| c[1]}.join
  end
end