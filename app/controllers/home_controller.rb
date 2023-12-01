class HomeController < ApplicationController

    before_action :set_page_active

    def index

        # -- busca pelo total de registros individualizdos na coluna do csv --
        @total_de_matriculas = Csv.getTotalColuna('MATRICULA')
        @total_de_disciplinas = Csv.getTotalColuna('COD_DISCIPLINA')
        @total_de_cursos = Csv.getTotalColuna('COD_CURSO')
        @total_de_notas = Csv.getTotalColuna('NOTA')
        @total_de_cargas_horarias = Csv.getTotalColuna('CARGA_HORARIA')
        @total_de_anos_semestres = Csv.getTotalColuna('ANO_SEMESTRE')

        # -- busca pelo somatorios de registros individualizdos na coluna do csv --
        @soma_das_notas = Csv.getSomaColuna('NOTA')
        @soma_das_cargas_horarias = Csv.getSomaColuna('CARGA_HORARIA')

        
    end




    def set_page_active
        @page_active = "home"
        return @page_active
    end
    
end
