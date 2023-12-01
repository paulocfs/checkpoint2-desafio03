class MatriculasController < ApplicationController

    before_action :set_page_active

    def index
         #busca todas as matriculas
        @matriculas = Csv.getColuna('MATRICULA')

        #faz a contagem de todas as matriculas
        @total_de_matriculas = Csv.getTotalColuna('MATRICULA')
    end

    def set_page_active
        @page_active = "matriculas"
        return @page_active
    end

end
