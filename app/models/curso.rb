class Curso < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    def self.get_all_cursos
        @cursos = CSV.read(@path_to_csv, headers: true)
        return @cursos
    end




    def self.getcurso_by_codigo(codigo)
        @curso = CSV.read(@path_to_csv, headers: true).select { |row| row["COD_CURSO"] == codigo}
        return @curso
    end


    #def self.obterCursoMatricula(codigo, matricula)
     #   @cursos_alunos = CSV.read(@path_to_csv, headers: true).select{ |row| 
      #    row["COD_CURSO"] == codigo && row['MATRICULA'] == matricula
       # }

        #return @cursos_alunos
       
    #end




    
   

    def self.get_total_cursos()

        cursos = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            cursos << row['COD_CURSO']
        end

        contagem_cursos = cursos.tally

        return contagem_cursos.size
        
    end

    def self.get_total_curso_por_matricula(matricula)

        total= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                total << row['COD_CURSO']
            end
        end

       

        return total.tally.size
        
    end

    def self.get_total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso(matricula, codigo_do_curso)

        total= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == codigo_do_curso)
                total << row['COD_CURSO']
            end
        end

        return total.size
    end



    def self.get_total_carga_horaria_do_curso(curso)

        total = 0

        curso.each do |c|
            total += c['CARGA_HORARIA'].to_i
        end

        return total

    end
  

end
