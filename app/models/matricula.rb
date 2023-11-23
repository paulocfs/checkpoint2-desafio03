class Matricula < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    def self.get_total_matriculas

        matriculas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            matriculas << row['MATRICULA']
        end

        contagem_matriculas = matriculas.tally

        return contagem_matriculas.size
    end





end
