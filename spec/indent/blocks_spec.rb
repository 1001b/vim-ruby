require 'spec_helper'

describe "Indenting" do
  specify "case-insensitive matching" do
    VIM.set 'ignorecase'
    assert_correct_indenting <<-EOF
      module X
        Class.new do
        end
      end
    EOF
    VIM.set 'ignorecase&'
  end

  specify "blocks with tuple arguments" do
    assert_correct_indenting <<-EOF
      proc do |(a, b)|
        puts a
        puts b
      end
    EOF

    assert_correct_indenting <<-EOF
      proc do |foo, (a, b), bar|
        puts a
        puts b
      end
    EOF

    assert_correct_indenting <<-EOF
      proc do |(a, (b, c)), d|
        puts a, b
        puts c, d
      end
    EOF
  end
end
