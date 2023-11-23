class Semestre < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')

    def self.get_total_semestres

        semestres = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            semestres << row['ANO_SEMESTRE']
        end

        contagem_semestres = semestres.tally

        return contagem_semestres.size
    end

    def self.get_total_semestres_por_matricula(matricula)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                total << row['ANO_SEMESTRE']
            end
        end

       

        return total.tally.size
        
    end


end
