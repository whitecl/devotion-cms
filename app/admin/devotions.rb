ActiveAdmin.register Devotion do

  index do
    column :contributor
    column :devotion_day
    column :title
    column :your_name
    column :Preview do |devotion|
      link_to 'Preview', preview_devotion_path(devotion)
    end
    default_actions
  end

  form do |f|
    f.inputs "Administrative" do
      f.input :contributor
      f.input :devotion_day
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
      f.input :attachment, as: :file
    end

    f.buttons
  end  
end
