class SaveLabels
  def self.write(labels)
    File.write('./data/labels.json', JSON.pretty_generate({ 'labels' => labels.map do |label|
      {
        'id' => label.id,
        'title' => label.title,
        'color' => label.color
      }
    end }))
  end

  def self.read
    file_path = './data/labels.json'
    return [] unless File.exist?(file_path)

    labels_data = JSON.parse(File.read(file_path))
    labels_list = []

    labels_data['labels'].each do |label_data|
      label = Label.new(label_data['title'], label_data['color'])
      label.instance_variable_set(:@id, label_data['id']) # Set the id directly, as it's a read-only attribute
      labels_list << label
    end
    labels_list
  end
end
