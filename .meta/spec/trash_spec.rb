require 'tmpdir'

RSpec.describe 'The binary “darwin-trash”', darwin: true do
  around(:example) do |example|
    Dir.mktmpdir('test-root') do |dir|
      Dir.chdir(dir) do
        example.run
      end
    end
  end

  subject { File.expand_path('../../libexec/darwin-trash', __FILE__) }

  it 'trashes a file' do
    f = File.open('test-file', 'a')
    f.close
    `#{subject} #{f.path}`
    expect(File).not_to exist(f.path)
  end

  it 'trashes a folder' do
    Dir.mkdir('test-dir')
    Dir.chdir('test-dir') do
      File.new('test-file-0', 'a')
      File.new('test-file-1', 'a')
      Dir.mkdir('test-dir-0')
      File.new('test-dir-0/test-file-2', 'a')
    end
    `#{subject} test-dir`
    expect(File).not_to exist('test-dir')
  end
end
