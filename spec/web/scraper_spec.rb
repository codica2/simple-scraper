RSpec.describe Web::Scraper do
  it 'has a version number' do
    expect(Web::Scraper::VERSION).not_to be nil
    Web::Scraper.number_of_threads = 10
    obj = Web::Scraper::PageParser.new(
      title: { selector: "//h1[contains(@class, 'title')]", handler: ->(els) { els.first.text }, default: 'ror' },
      desc: { selector: "//fakeselector", handler: ->(els) { els.first.text }, default: 'Ruby' },
    ).parse(
      [
        'https://fcmriya.com/',
        'https://fcmriya.com/',
        'https://fcmriya.com/',
        'https://fcmr/',
      ]
    )
      p obj
    expect(obj.first[:title]).to eq 'У ФК "Мрія UFC" чергове поповнення'
    expect(obj.first[:desc]).to eq 'ror'
  end

  it 'does something useful' do
    # expect(false).to eq(false)
  end
end
