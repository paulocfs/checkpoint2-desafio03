class Aluno < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    def self.get_alunos
        
        @alunos = CSV.read(@path_to_csv, headers: true)
        return @alunos
    
    end

    def self.get_matriculas
        
        matriculas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            matriculas << row['MATRICULA']
        end

        return  matriculas.tally
    
    end

    def self.get_total_de_matriculas
        
        matriculas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            matriculas << row['MATRICULA']
        end

        return  matriculas.tally.size
    
    end

   


    def self.getnotas_by_matricula(matricula)
        @notas_alunos = CSV.read(@path_to_csv, headers: true).select { |row| row["MATRICULA"] == matricula}
        
    end

    def self.get_aluno_pelo_codigo_do_curso(codigo_do_curso, matricula)
        @alunos_pelo_curso = CSV.read(@path_to_csv, headers: true).select{ |row| 
            row["COD_CURSO"] == codigo_do_curso && row['MATRICULA'] == matricula
        }

        return @alunos_pelo_curso
    end
end
