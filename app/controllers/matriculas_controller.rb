class MatriculasController < ApplicationController


    def index
        @matriculas = Aluno.get_matriculas
        @total_de_matriculas = Aluno.get_total_de_matriculas
    end
end
