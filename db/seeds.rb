# Admin member
m = Member.new(email: 'lemoney@admin.com', password: 'password', admin: true)
m.save

# Regular member
m2 = Member.new(email: 'lemoney@member.com', password: 'password')
m2.save

# Offers
apple = Offer.new(advertiser_name: "Apple", url: "https://www.apple.com/", description: "Lorem ipsum is
simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text
ver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
starts_at: Date.current, ends_at: Date.current, member_id: 1)
apple.save

walmart = Offer.new(advertiser_name: "Walmart", url: "https://www.walmartbrasil.com.br/sobre/walmart-no-brasil/", description: "Lorem ipsum is
simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text
ver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
premium: true, starts_at: Date.current, ends_at: Date.current, member_id: 1)
walmart.save

mercadolivre = Offer.new(advertiser_name: "Mercado Livre", url: "https://www.mercadolivre.com.br/", description: "Lorem ipsum is
simply dummy text of the printing and typesetting industry. lorem ipsum has been the industry's standard dummy text
ver since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
premium: true, starts_at: Date.current, ends_at: Date.current, member_id: 1)
mercadolivre.save

