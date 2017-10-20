require 'java'
java_import 'javax.swing.JFrame';
java_import 'javax.swing.JPanel';
java_import 'java.awt.Dimension';

class MyPanel < JPanel
  def paintComponent(graphics) #method override must be camelcase
    1.upto(1000) do |i|
      x = (Math.sin(i) + 1) * 320
      y = (Math.cos(i * 0.2) + 1) * 240
      graphics.draw_oval(x, y, 10, 10)
    end
  end
end

frame = JFrame.new 'Hello, JRuby!'
frame.size = Dimension.new 640, 480
frame.add MyPanel.new
frame.visible = true
