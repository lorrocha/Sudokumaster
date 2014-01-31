require "sudoku"
require "box"

describe Box do
  let(:puzzle) {[
      [0, 4, 0, 8, 0, 7, 0, 0, 2],
      [1, 0, 8, 9, 4, 0, 7, 5, 0],
      [3, 2, 0, 6, 0, 0, 0, 9, 0],
      [0, 9, 0, 0, 0, 3, 8, 0, 1],
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [7, 0, 5, 4, 0, 0, 0, 3, 0],
      [0, 5, 0, 0, 0, 4, 0, 8, 6],
      [0, 7, 1, 0, 8, 6, 9, 0, 5],
      [4, 0, 0, 1, 0, 5, 0, 2, 0]
    ]}

  let(:sudokugame) { SudokuGame.new(puzzle) }
  let(:box)  { Box.new(0, 0, 0, sudokugame) }
  let(:box2) { Box.new(1, 0, 1, sudokugame) }

  it "is not solved if the value is zero" do
    expect(box.solved?).to be_false
  end

  it "is solved if the value is not zero" do
    expect(box2.solved?).to be_true
  end

  it "can show the value" do
    expect(box.value).to eql(0)
  end

end
