class MP3Importer
  attr_reader :path, :files

  def initialize(file_path)
    @path  = file_path
    @files = []
    Dir["#{file_path}/*.mp3"].each do |file|
      @files << File.basename(file)
    end
  end

  def import
    @files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
end