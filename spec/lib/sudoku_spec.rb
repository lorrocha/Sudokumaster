require "sudoku"

describe SudokuGame do
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

  it "knows whether or not an individual square is solved" do
    expect(sudokugame[0][0].solved?).to be_false
  end

  it "knows whether or not the entire puzzle is solved" do
    expect(sudokugame.solved?).to be(false)
  end

  it "reports out the row values for a particular row" do
    expect(sudokugame.row_values(5)).to eql([7, 0, 5, 4, 0, 0, 0, 3, 0])
  end

  it "reports out the column values for a particular column" do
    expect(sudokugame.column_values(5)).to eql([7, 0, 0, 3, 0, 0, 4, 6, 5])
  end

  it "reports out the box values for a particular box" do
    expect(sudokugame.box_values(0, 0)).to eql([0, 4, 0, 1, 0, 8, 3, 2, 0])
  end

  it "determines which members are in its row" do
    expect(sudokugame[0][0].row_member_values).to eql([0, 4, 0, 8, 0, 7, 0, 0, 2])
  end

  it "determines which members are in its column" do
    expect(sudokugame[0][0].column_member_values).to eql([0, 1, 3, 0, 0, 7, 0, 0, 4])
  end

  it "determines which members are in its box" do
    expect(sudokugame[0][0].box_member_values).to eql([0, 4, 0, 1, 0, 8, 3, 2, 0])
  end

  it "determines which options are left for a box" do
    expect(sudokugame[0][0].options).to eql([5, 6, 9])
  end

  it "determines which options are left for a box" do
    expect(sudokugame[2][0].options).to eql([5])
  end

  it "determines which options are left for a box" do
    expect(sudokugame[2][5].options).to eql([1])
  end

  it "solves the puzzle" do
    expect(sudokugame.solve).to eql("549837612\n168942753\n327651498\n694523871\n832719564\n715468239\n953274186\n271386945\n486195327\n")
  end

end
