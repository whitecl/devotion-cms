ActiveAdmin.register Devotion do

  form do |f|
    f.inputs "Administrative" do
      f.input :contributor_id
      f.input :devotion_day_id
    end

    f.inputs "Devotion Content" do
      f.input :title
      f.input :bible_text
      f.input :bible_book
      f.input :bible_chapter
      f.input :bible_verse
      f.input :content, as: :rich
      f.input :your_name
      f.input :about_me
    end

    f.buttons
  end  
end
