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
          label_data['id']
          label_data['title']
          label_data['color']
          labels_list << Label.new(label_data)
        end
        labels_list
      end
end