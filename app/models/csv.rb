class Csv < ApplicationRecord

    require 'csv'

    @path_to_csv = Rails.root.join('app', 'models', 'alunos.csv')


    def self.getTotalColuna(nome_da_coluna)

        dados = []

        

        if(nome_da_coluna == 'CARGA_HORARIA'|| nome_da_coluna == 'NOTA') 
            
            CSV.foreach(@path_to_csv, headers: true) do |row|
                dados << row[nome_da_coluna]
            end

            return dados.size + 1

        else

            CSV.foreach(@path_to_csv, headers: true) do |row|
                dados << row[nome_da_coluna]
            end

            return dados.tally.size

        end

       
    end

    def self.getSomaColuna(nome_da_coluna)

        soma = 0

        CSV.foreach(@path_to_csv, headers: true) do |row|
            soma += row[nome_da_coluna].to_i
        end

        return soma
    end

    def self.getAll()
        @alunos = CSV.read(@path_to_csv, headers: true)
        return @alunos
    end




    def self.getColuna(nome_da_coluna)

        dados = []

        CSV.foreach(@path_to_csv, headers: true) do |row|
            dados << row[nome_da_coluna]
        end

        return dados.tally
    end


    def self.getDadosPelaCondicao(nome_da_coluna, condicao)

        @coluna = CSV.read(@path_to_csv, headers: true).select { |row| row[nome_da_coluna] == condicao}
        return @coluna

    end





    def self.getTotalColunaByCondition(coluna_pesquisada, condicao, coluna_da_condicao )

        total = []

       
        CSV.foreach(@path_to_csv, headers: true) do |row|
            if(row[coluna_da_condicao] == condicao)
                total << row[coluna_pesquisada]
            end
        end

        return total.uniq.size
       
        
    end

    def self.getSomaColunaPelaCondicao(coluna_pesquisada, condicao, coluna_da_condicao )

        soma = 0

       
        CSV.foreach(@path_to_csv, headers: true) do |row|
            if(row[coluna_da_condicao] == condicao)
                soma += row[coluna_pesquisada].to_i
            end
        end

        return soma
       
        
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
        
        soma_das_notas_pela_matricula = getSomaColunaPelaCondicao('NOTA', matricula, 'MATRICULA')
        total_de_notas = getTotalColunaByCondition('NOTA', matricula, 'MATRICULA')

        media = soma_das_notas_pela_matricula.to_i / total_de_notas.to_i

        return media
        
    end



    def self.get_crfinal_da_matricula(matricula)       
        
        soma_dos_pchs_pela_matricula = get_soma_dos_pchs_da_matricula(matricula)

       
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

        cr_final_da_matricula = soma_dos_pchs_pela_matricula/soma_das_cargas_horarias_da_matricula

        return cr_final_da_matricula
    end










end
