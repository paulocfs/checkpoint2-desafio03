class Disciplina < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')

    def self.get_total_discipinas()

        disciplinas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            disciplinas << row['COD_DISCIPLINA']
        end

        contagem_disciplinas = disciplinas.tally

        return contagem_disciplinas.size
        
    end



    def self.get_total_disciplina_por_matricula(matricula)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                total << row['COD_DISCIPLINA']
            end
        end

       

        return total.tally.size
        
    end

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
