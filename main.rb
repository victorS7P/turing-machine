require_relative "turing-machine"

if ARGV.length < 2
  puts "Indique qual máquina deseja usar e dê uma entrada"
  exit
end

should_print = ARGV[2] == "true"
if ARGV[0] == "-m"
  puts "Maquina de multiplicação selecionada"
  puts "Entrada: #{ARGV[1]}"

  machine = TuringMachine.new("./multiplication.json", should_print)
  puts "Saída  : #{machine.run(ARGV[1])}"
elsif ARGV[0] == "-p"
  puts "Maquina de potencialização selecionada"
  puts "Entrada: #{ARGV[1]}"

  machine = TuringMachine.new("./power-of.json", should_print)
  puts "Saída  : #{machine.run(ARGV[1])}"
else
  puts "Digite -m para a máquina de multiplicação ou -p para a de potencialização"
  exit
end