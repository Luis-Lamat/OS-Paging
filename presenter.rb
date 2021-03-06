require_relative "administrador"

class Presenter

  # imprime todos los page faults de los procesos
  def self.print_page_faults
    page_faults = Administrador.get_page_faults
    puts "Page faults:"
    unless page_faults.empty?
      page_faults.each do |k,v|
        print "Proceso #{k}: #{v}\n"
      end
    else
      puts "No hay..."
    end
    puts # este comando imprime un newline char
  end

  # imprime todos swap_ins y swap_outs de los procesos
  def self.print_swaps
    swap_ins  = Administrador.get_swap_ins
    swap_outs = Administrador.get_swap_outs

    puts "Swap ins:"
    unless swap_ins.empty?
      swap_ins.each do |k,v|
        print "Proceso #{k}: #{v}\n"
      end
    else
      puts "No hay..."
    end

    puts
    puts "Swap outs:"
    unless swap_outs.empty?
      swap_outs.each do |k,v|
        print "Proceso #{k}: #{v}\n"
      end
    else
      puts "No hay..."
    end
    puts
  end

  # imprime todos los turnarounds de los procesos y el promedio
  def self.print_turnaround_times
    turn_arounds = Administrador.get_turn_arounds
    suma = 0
    puts "Turnarounds"
    unless turn_arounds.empty?
      turn_arounds.each do |k,v|
        puts "Proceso #{k}: #{v * 1000} ms"
        suma += v * 1000
      end      
    else
      puts "No hay..."
    end
    if turn_arounds.length > 0
      promedio = suma / turn_arounds.length
    else
      promedio = "No hay..."
    end 
    puts "Turnaround Promedio: #{promedio}"
    puts
  end

  # hace el reporte de "F", llama a las demas funciones
  def self.hacer_reporte
    puts "Fin. Reporte de Salida:\n"
    puts "-------------------"
    print_page_faults
    print_turnaround_times
    print_swaps
    puts "-------------------"
  end

end