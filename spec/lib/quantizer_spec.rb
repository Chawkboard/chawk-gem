require 'spec_helper'


ts1 = [['A',100],['B',99],['C',95],['D',50],['E',45],['F',30],['G',29],['H',28]]
ts2 = [['A',100],['B',85],['C',80],['D',71],['E',70],['F',30],['G',29],['H',28]]

class Qharness
	include Chawk::Quantizer
	attr_accessor :datum
	def initialize()
		@datum = datum
	end
end

describe Chawk::Quantizer do
	qh = nil
	before :all do
		qh = Qharness.new()
	end

    it "has quantize()" do
 		qh.should respond_to(:quantize)
    end

    it "does quantize" do
 		lambda{qh.quantize(ts1,100)}.should_not raise_error()
 		qh.quantize(ts1,10).should eq(
			[["A", 100], ["C", 90], ["C", 80], ["C", 70], ["C", 60], ["E", 50], ["E", 40], ["H", 30], ["H", 20]]
 		)
 		qh.quantize(ts2,10).should eq(
			[["A", 100], ["B", 90], ["D", 80], ["E", 70], ["E", 60], ["E", 50], ["E", 40], ["H", 30], ["H", 20]]
 		)
 		qh.quantize(ts2,5).should eq(
[["A", 100], ["A", 95], ["A", 90], ["B", 85], ["C", 80], ["D", 75], ["E", 70], ["E", 65], ["E", 60], ["E", 55], ["E", 50], ["E", 45], ["E", 40], ["E", 35], ["H", 30], ["H", 25]] 		)
    end

    it "picks first step" do
    	qh.starting_step(101,10).should eq(110)
    	qh.starting_step(111,10).should eq(120)
    	qh.starting_step(100,10).should eq(100)
    	qh.starting_step(99,10).should eq(100)
    	qh.starting_step(92,10).should eq(100)
    	qh.starting_step(91,10).should eq(100)
    	qh.starting_step(90,10).should eq(90)
    	qh.starting_step(1,10).should eq(10)
    	qh.starting_step(3,10).should eq(10)
    	qh.starting_step(7,10).should eq(10)
    	qh.starting_step(10,10).should eq(10)
    	qh.starting_step(101,5).should eq(105)
    	qh.starting_step(102,5).should eq(105)
    	qh.starting_step(105,5).should eq(105)
    	qh.starting_step(107,5).should eq(110)
    end

    it "picks last step" do
    	qh.ending_step(101,10).should eq(100)
    	qh.ending_step(111,10).should eq(110)
    	qh.ending_step(100,10).should eq(100)
    	qh.ending_step(101,5).should eq(100)
    	qh.ending_step(106,5).should eq(105)
    	qh.ending_step(100,5).should eq(100)
    end


end