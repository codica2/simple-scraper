RSpec.describe Web::Scraper do
  it 'has a version number' do
    expect(Web::Scraper::VERSION).not_to be nil

    Web::Scraper.configure do |c|
      c.number_of_threads = 30
      c.logger = Logger.new('logs.log')
      c.proxy_addr = 'nestready.crawlera.com'
      c.proxy_port = 8010
      c.proxy_user = '73577f36f6a448b3963309fb4e41f66e:'
      c.proxy_pass = ''
    end

    Web::Scraper.reset

    parser_object = Web::Scraper::PageParser.new(
      title: { selector: "//*[@class='title']", handler: ->(els) { els.map(&:text) }, default: 'ror' }
    )

    obj = parser_object.parse(
      [
        'https://www.indeed.co.za/jobs'
      ],
      query: { q: 'financial manager', start: 10 }
    )
    expect(obj.first[:title]).to eq 'У ФК "Мрія UFC" чергове поповнення'
    expect(obj.first[:desc]).to eq 'ror'
  end
end
