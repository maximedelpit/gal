ActiveAdmin.register Tutorial do
  permit_params :youtube_id, :title, :description


  form do |f|
    f.inputs :youtube_id, :title, :description
    f.button 'OK'
  end
end
