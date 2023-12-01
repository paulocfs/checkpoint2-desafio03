class Disciplina < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    def self.get_disciplinas

        disciplinas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            disciplinas << row['COD_DISCIPLINA']
        end

        return disciplinas.tally
    end

    #ok
    def self.get_total_de_discipinas()

        total_de_disciplinas = get_disciplinas.size
        return total_de_disciplinas
        
    end


    #ok
    def self.get_total_disciplina_por_matricula(matricula)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                total << row['COD_DISCIPLINA']
            end
        end

       

        return total.tally.size
        
    end

    #ok
    def self.get_total_de_todas_disciplinas_pelo_codigo_do_curso(codigo_do_curso)

        total= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['COD_CURSO'] == codigo_do_curso)
                total << row['COD_DISCIPLINA']
            end
        end

        return total.tally.size
    end

    #ok
    def self.get_total_de_disciplinas_do_aluno_pelo_codigo_do_curso(matricula, codigo_do_curso)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == codigo_do_curso)
                total << row['COD_DISCIPLINA']
            end
        end


        return total.tally.size
    end


end
