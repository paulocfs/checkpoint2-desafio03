class Nota < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')

    def self.get_total_notas()

        notas = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            notas << row['NOTA']
        end

        

        return notas.size
        
    end


    def self.get_total_notas_por_matricula(matricula)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                total << row['NOTA']
            end
        end

        return total.size
        
    end

    def self.get_total_de_notas_do_aluno_pelo_codigo_do_curso(matricula, curso)

        total = []

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == curso)
                total << row['NOTA']
            end
        end

        return total.size
        
    end


    def self.get_soma_das_notas_pela_matricula(matricula)

        notas = []
        soma_das_notas = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                notas << row['NOTA']                
            end

        end

        
        notas.each do |n|
            soma_das_notas+= n.to_i
        end
        
        return soma_das_notas
    end

    def self.get_soma_das_notas_pelo_curso(matricula, codigo_do_curso)

        notas = []
        soma_das_notas = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula && row['COD_CURSO'] == codigo_do_curso)
                notas << row['NOTA']                
            end

        end

        
        notas.each do |n|
            soma_das_notas+= n.to_i
        end
        
        return soma_das_notas
    end



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



    def self.get_soma_dos_pchs_da_matricula(matricula)

        #percorrer o array de notas
        pchs = []
        soma_dos_pchs_da_matricula = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|

            if(row['MATRICULA'] == matricula)
                pchs << row['NOTA'].to_i * row['CARGA_HORARIA'].to_i                
            end
        end

        pchs.each do |pch|
            soma_dos_pchs_da_matricula += pch.to_i 
        end

        return soma_dos_pchs_da_matricula
       
    end
        

        

  


    def self.get_media_aritmetica_notas_da_matricula(matricula)       
        
        soma_das_notas_pela_matricula = get_soma_das_notas_pela_matricula(matricula)

        total_de_notas = get_total_notas_por_matricula(matricula)
        media = soma_das_notas_pela_matricula.to_i / total_de_notas.to_i
        return media
        
    end

    def self.get_crfinal_da_matricula(matricula)       
        
        soma_dos_pchs_pela_matricula = get_soma_dos_pchs_da_matricula(matricula)
        soma_das_cargas_horarias_pela_matricula = get_soma_das_cargas_horarias_pela_matricula(matricula)

        cr_final_da_matricula = soma_dos_pchs_pela_matricula/soma_das_cargas_horarias_pela_matricula

        return cr_final_da_matricula
    end




end
