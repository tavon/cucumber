module Cucumber
  module Ast
    class OutlineTable < Table
      def initialize(raw, scenario_outline)
        super(raw)
        @scenario_outline = scenario_outline
        @cells_class = ExampleCells
      end

      def execute_row(cells)
        @scenario_outline.execute_row(cells)
      end

      class ExampleCells < Cells
        def accept(visitor, status)
          if header?
            visit_cells(visitor, :skipped)
          else
            @table.execute_row(self.to_hash)
            visit_cells(visitor, :passed)
          end
        rescue StepMom::Missing
          visit_cells(visitor, :missing)
        rescue StepMom::Pending
          visit_cells(visitor, :pending)
        rescue Exception => error
          visit_cells(visitor, :failed)
        end

        private

        def header?
          index == 0
        end

        def visit_cells(visitor, status)
          each do |cell|
            visitor.visit_table_cell(cell, status)
          end
        end
      end
    end
  end
end