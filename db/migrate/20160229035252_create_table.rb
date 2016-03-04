class CreateTable < ActiveRecord::Migration
  def change
    # keywords table
    create_table :arts, force: true, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |tbl|
      tbl.column :text, :string, null: false
      tbl.timestamps null: false
    end
    
    # textrubies table
    create_table :aarubies, force: true, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |tbl|
      tbl.column :art_id, :integer, null: false
      tbl.column :text,   :string,  null: false
      tbl.timestamps null: false
    end
    add_index :aarubies, :art_id
    add_index :aarubies, [:art_id, :text], unique: true
    
    
    # table初期化
    return Unless Aaruby::empty?
    ActiveRecord::Base.transaction do
      # AA => [ruby] なオブジェクトを生成
      kaomoji = Settings::kaomoji.inject({}) do |obj, data|
        obj[data.aa] = Array.new unless obj.has_key? data.aa
        obj[data.aa] << data.txt
        obj
      end
      
      # AA毎にDB登録
      kaomoji.each do |aa, rubies|
        art = Art.create(text: aa)
        rubies.uniq.each{|text|
          obj = art.aarubies.build(text: text)
          obj.save
        }
      end
    end
    
  end
end
