require_relative "turing-machine"

if ARGV.length < 2
  puts "Indique qual máquina deseja usar e dé uma entrada"
  exit
end

if ARGV[0] == "-m"
  puts "Maquina de multiplicação selecionada"
  puts "Entrada: #{ARGV[1]}"

  machine = TuringMachine.new("./multiplication.json", ARGV[2])
  puts "Saída  : #{machine.run(ARGV[1])}"
elsif ARGV[0] == "-p"
  puts "Maquina de potencialização selecionada"
  puts "Entrada: #{ARGV[1]}"

  machine = TuringMachine.new("./power-of.json", ARGV[2])
  puts "Saída  : #{machine.run(ARGV[1])}"
else
  puts "Digite -m para a máquina de multiplicação ou -p para a de potencialização"
end