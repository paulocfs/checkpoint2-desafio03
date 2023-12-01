class DisciplinasController < ApplicationController


    #seta a pagina que esta ativa no menu-sidebar
    before_action :set_page_active

   

    def index
        #busca todas as disciplinas
     
        @disciplinas = Csv.getColuna('COD_DISCIPLINA')

        #faz a contagem de todas as disciplinas
        @total_de_disciplinas = Csv.getTotalColuna('COD_DISCIPLINA')
    end


    def set_page_active
        @page_active = "disciplinas"
        return @page_active
    end

end
