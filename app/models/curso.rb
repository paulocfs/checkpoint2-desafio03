class Curso < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    #ok
    def self.get_cursos

        cursos = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            cursos << row['COD_CURSO']
        end

        return cursos.tally
    end

    #ok
    def self.get_total_de_cursos()

        cursos = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            cursos << row['COD_CURSO']
        end

        contagem_cursos = cursos.tally

        return contagem_cursos.size
        
    end

    #ok
    def self.get_curso_pelo_codigo(codigo)
        @curso = CSV.read(@path_to_csv, headers: true).select { |row| row["COD_CURSO"] == codigo}
        return @curso
    end


   # def self.get_all_cursos
    #    @cursos = CSV.read(@path_to_csv, headers: true)
     #   return @cursos
    #end







    #def self.obterCursoMatricula(codigo, matricula)
     #   @cursos_alunos = CSV.read(@path_to_csv, headers: true).select{ |row| 
      #    row["COD_CURSO"] == codigo && row['MATRICULA'] == matricula
       # }

        #return @cursos_alunos
       
    #end



    def self.get_soma_dos_pchs_pelo_codigo_do_curso(codigo_do_curso)
        
        pchs= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['COD_CURSO'] == codigo_do_curso)
                pchs << row['NOTA'].to_i * row['CARGA_HORARIA'].to_i
            end
        end

        soma_dos_pchs_pelo_curso = 0
        
        pchs.each do |pch|
            soma_dos_pchs_pelo_curso += pch.to_i
        end

        return soma_dos_pchs_pelo_curso

    end
    
    def self.get_soma_das_pchs_do_aluno_pelo_curso(matricula, codigo_do_curso)
        
        pchs= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['COD_CURSO'] == codigo_do_curso && row['MATRICULA'] == matricula)
                pchs << row['NOTA'].to_i * row['CARGA_HORARIA'].to_i
            end
        end

        soma_dos_pchs_do_aluno_pelo_curso = 0
        
        pchs.each do |pch|
            soma_dos_pchs_do_aluno_pelo_curso += pch.to_i
        end

        return soma_dos_pchs_do_aluno_pelo_curso

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


    #ok
    def self.get_total_de_cargas_horarias_do_aluno_pelo_codigo_do_curso(matricula, codigo_do_curso)

        total= []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == codigo_do_curso)
                total << row['COD_CURSO']
            end
        end

        return total.size
    end



   # def self.get_total_carga_horaria_do_curso(curso)

        #total = 0

        #curso.each do |c|
         #  total += c['CARGA_HORARIA'].to_i
        #end

        #return total

    #end


    def self.get_soma_das_cargas_horarias()

        total= 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            total += row['CARGA_HORARIA'].to_i
            
        end

        return total
    end


    #ok
    def self.get_soma_das_cargas_horarias_pelo_codigo_do_curso(codigo_do_curso)

        total= 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['COD_CURSO'] == codigo_do_curso)
                total += row['CARGA_HORARIA'].to_i
            end
        end

        return total
    end


    #ok
    def self.get_soma_das_cargas_horarias_do_aluno_pelo_curso(matricula, codigo_do_curso)

        cargas_horarias = []
        soma_das_cargas_horarias_da_matricula_pelo_curso = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == codigo_do_curso)
                cargas_horarias << row['CARGA_HORARIA']                
            end

        end

        
        cargas_horarias.each do |ch|
            soma_das_cargas_horarias_da_matricula_pelo_curso+= ch.to_i
        end
        
        return soma_das_cargas_horarias_da_matricula_pelo_curso
    end

    #ok
    def self.get_soma_das_cargas_horarias_pela_matricula(matricula)

        cargas_horarias = []
        soma_das_cargas_horarias_da_matricula = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                cargas_horarias << row['CARGA_HORARIA']                
            end

        end

        
        cargas_horarias.each do |ch|
            soma_das_cargas_horarias_da_matricula+= ch.to_i
        end
        
        return soma_das_cargas_horarias_da_matricula
    end


end
