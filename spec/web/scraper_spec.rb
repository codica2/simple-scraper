RSpec.describe Web::Scraper do
  it 'has a version number' do
    expect(Web::Scraper::VERSION).not_to be nil
    obj = Web::Scraper::PageParser.new(
      title: { selector: "//h1[contains(@class, 'title')]", handler: ->(els) { els.first.text }, default: 'ror' },
      desc: { selector: '//notexists', handler: ->(els) { els.first.text }, default: 'ror' }
    ).parse('https://fcmriya.com/')

    expect(obj[:title]).to eq 'У ФК "Мрія UFC" чергове поповнення'
    expect(obj[:desc]).to eq 'ror'
  end

  it 'does something useful' do
    # expect(false).to eq(false)
  end
end
