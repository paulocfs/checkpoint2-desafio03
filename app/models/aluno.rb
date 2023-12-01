class Aluno < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    #ok
    #def self.get_alunos
        
        #@alunos = CSV.read(@path_to_csv, headers: true)
        #return @alunos
    
    #end

    #ok
    def self.get_matriculas
        
        matriculas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            matriculas << row['MATRICULA']
        end

        return  matriculas.tally
    
    end

    #ok
    #def self.get_total_de_matriculas
        
     #   matriculas = []

      #  CSV.foreach(@path_to_csv, headers: true) do |row|
       #     matriculas << row['MATRICULA']
       # end

        #return  matriculas.tally.size

    
    #end

   


    def self.getnotas_by_matricula(matricula)
        @notas_alunos = CSV.read(@path_to_csv, headers: true).select { |row| row["MATRICULA"] == matricula}
        
    end

    #ok
    def self.get_aluno_pelo_codigo_do_curso(codigo_do_curso, matricula)
        @alunos_pelo_curso = CSV.read(@path_to_csv, headers: true).select{ |row| 
            row["COD_CURSO"] == codigo_do_curso && row['MATRICULA'] == matricula
        }

        return @alunos_pelo_curso
    end


    #ok
    def self.get_total_de_todas_matriculas_pelo_codigo_do_curso(codigo_do_curso)

        total= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['COD_CURSO'] == codigo_do_curso)
                total << row['MATRICULA']
            end
        end

        return total.tally.size
    end
end
