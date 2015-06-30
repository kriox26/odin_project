require "caesar"

describe "Caesar cipher" do
    describe "#caesar_cipher" do
      context "with right parameters" do
        it "returns yxocll with barfoo and 23 as a key" do
          expect(caesar_cipher("barfoo", 23)).to eq("yxocll")
        end
        it "returns EDUIRR with BARFOO and 3 as a key" do
          expect(caesar_cipher("BARFOO", 3)).to eq('EDUIRR')
        end
        it "returns FeVJss with BaRFoo and 4 as a key" do
          expect(caesar_cipher("BaRFoo",4)).to eq('FeVJss')
        end
        it "returns onesbb with barfoo and 65 as a key" do
          expect(caesar_cipher("barfoo",65)).to eq('onesbb')
        end
        it "returns iadxp, emk tqxxa! with world, say hello! and 12 as a key" do
          expect(caesar_cipher("world, say hello!",12)).to eq('iadxp, emk tqxxa!')
        end
      end
      context "with wrong parameters" do
        it "returns nill with a string and wrong key" do
          expect(caesar_cipher("barfoo",-2)).to eq(nil)
        end
        it "returns nill with an empty string and a key" do
          expect(caesar_cipher("",12)).to eq(nil)
        end
        it "returns nill with empty string and wrong key" do
          expect(caesar_cipher("",-2)).to eq(nil)
        end
      end
    end
end
