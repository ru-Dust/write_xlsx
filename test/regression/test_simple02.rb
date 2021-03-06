# -*- coding: utf-8 -*-
require 'helper'

class TestRegressionSimple02 < Test::Unit::TestCase
  def setup
    setup_dir_var
  end

  def teardown
    File.delete(@xlsx) if File.exist?(@xlsx)
  end

  def test_simple02
    @xlsx = 'simple02.xlsx'
    workbook  = WriteXLSX.new(@xlsx)
    worksheet1 = workbook.add_worksheet
    worksheet2 = workbook.add_worksheet('Data Sheet')
    worksheet3 = workbook.add_worksheet

    bold = workbook.add_format(:bold => 1)

    worksheet1.write('A1', 'Foo')
    worksheet1.write('A2', 123)

    worksheet3.write('B2', 'Foo')
    worksheet3.write('B3', 'Bar', bold)
    worksheet3.write('C4', 234)

    workbook.close
    compare_xlsx_for_regression(File.join(@regression_output, @xlsx), @xlsx)
  end
end
