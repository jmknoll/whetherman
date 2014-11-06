class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|

      t.timestamps
    end
  end
end
