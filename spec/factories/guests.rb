FactoryBot.define do
  factory :guest do
    slug { "joao" }
    name { "João Marcos de Souza" }
    email { "joao@d3.do" }
    phone { "11984349901" }
    nickname { "João" }
    tag_nfc { "04:78:3C:82:58:49:80" }
    description { "Gosta de suco de limão" }
    greeting { "Opa" }
    bond { "member" }
    address { "Rua São Jorge" }
    address_number { "604" }
    address_complement { "apt 86 bloco B" }
    zip { "09530250" }
    city { "São Caetano do Sul" }
    state { "SP" }
    joined_at { "2002-09-20T18:14:21-03:00" }
    left_at { nil }
  end
end
