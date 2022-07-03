# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
FaceQuestion.create(
  [
    {
      :title => "顔の形状は",
      :answer_1 => "顔型は丸顔か横長のベース型である (顔の長さが短いほうである)",
      :answer_2 => "顔型は卵型か面長、縦長のベース型である (顔の長さが長いほうである)",
      :generation_or_shape => "true"
    },
    {
      :title => "あごは",
      :answer_1 => "短い",
      :answer_2 => "長い",
      :generation_or_shape => "true"
    },
    {
      :title => "目は",
      :answer_1 => "離れぎみ",
      :answer_2 => "寄っている",
      :generation_or_shape => "true"
    },
    {
      :title => "鼻は",
      :answer_1 => "低い",
      :answer_2 => "高い",
      :generation_or_shape => "true"
    },
    {
      :title => "顔の立体感は",
      :answer_1 => "平面的 (ハチが張っていたり、後頭部が絶壁など)",
      :answer_2 => "立体的 (鼻が高い、後頭部が後ろに長いなど)",
      :generation_or_shape => "true"
    },
    {
      :title => "小鼻は",
      :answer_1 => "横幅が目1つ分より小さい",
      :answer_2 => "横幅が目1つ分より大きい",
      :generation_or_shape => "true"
    },
    {
      :title => "口の大きさは",
      :answer_1 => "口が小さい",
      :answer_2 => "口が大きい",
      :generation_or_shape => "true"
    },
    {
      :title => "額の広さは",
      :answer_1 => "広い",
      :answer_2 => "狭い",
      :generation_or_shape => "true"
    },
    {
      :title => "目の位置は",
      :answer_1 => "頭の先から顎までのラインで中央より下側にある",
      :answer_2 => "頭の先から顎までのラインで中央より上側にある",
      :generation_or_shape => "true"
    },
    {
      :title => "顔に",
      :answer_1 => "骨を感じない (もしくは丸顔か卵型)",
      :answer_2 => "骨を感じる (鼻筋、エラ、頬骨、あごなどに)",
      :generation_or_shape => "false",
    },
    {
      :title => "頬は",
      :answer_1 => "丸く出ている",
      :answer_2 => "丸みがあまりなく、すっきりしている",
      :generation_or_shape => "false"
    },
    {
      :title => "目の印象は",
      :answer_1 => "丸く、縦幅がある",
      :answer_2 => "切れ長で、眼力が強い",
      :generation_or_shape => "false"
    },
    {
      :title => "まぶたは",
      :answer_1 => "幅の広い二重",
      :answer_2 => "一重もしくは奥二重",
      :generation_or_shape => "false"
    },
    {
      :title => "目の形は",
      :answer_1 => "たれ目",
      :answer_2 => "つり目",
      :generation_or_shape => "false"
    },
    {
      :title => "眉の形は",
      :answer_1 => "眉山がなく、アーチ型",
      :answer_2 => "眉山が角ばっている、もしくは直線的",
      :generation_or_shape => "false"
    },
    {
      :title => "鼻の印象は",
      :answer_1 => "小鼻に丸みがある",
      :answer_2 => "鼻筋が通っている",
      :generation_or_shape => "false"
    },
    {
      :title => "唇は",
      :answer_1 => "厚いほうである",
      :answer_2 => "薄いほうである",
      :generation_or_shape => "false"
    }
  ]
)
