require "charty"

charty = Charty::Plotter.new(:pyplot)

#days = [Date.new(2021, 9, 24), Date.new(2021, 9, 25), Date.new(2021, 9, 26), Date.new(2021, 9, 27), Date.new(2021, 9, 28)]
days = ['2021/04', '2021/05', '2021/06', '2021/07', '2021/08']

bar = charty.bar do
  series days, [10,40,20,90,70], label: "sample1"
  range x: 0..10, y: 1..100
  xlabel 'foo'
  ylabel 'bar'
  title 'bar plot'
end
bar.render("sample_images/bar_pyplot.png")
