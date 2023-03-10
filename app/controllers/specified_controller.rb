class SpecifiedController < ApplicationController
  def index
    @rns = []
    all_rn = ActiveRecord::Base.connection.execute("select * from rns")
    all_rn.each do |a|
      rns = Rn.new(a)
      @rns << rns
    end

    @spec = []
    idrn = params['idrn']
    puts idrn
    result = ActiveRecord::Base.connection.select_all("select * from roads where idrns = " + idrn)
    puts result
    result.each do |row|
      road = Roads.new(row)
      @spec << road
    end

    @alls = []
    all = params[:all] || []
    puts all
    all.each do |a|
      res = ActiveRecord::Base.connection.select_all("select * from roads where id = " + a)
      puts res
      @alls << Roads.new(res.first) if res.any?
    end

    formulas = ActiveRecord::Base.connection.execute("select * from formula where idnationalroute = " + idrn)
    formula = formulas[0]['quality']
    exist = false
    sub = ''
    @rns.each do |route|
      if formula.include?(route.name)
        exist = true
        subformulas = ActiveRecord::Base.connection.execute("select * from formula where idnationalroute = " + route.id.to_s )
        subformula = subformulas[0]['quality']
        sub = formula.gsub(route.name, subformula)
        formula = sub
        puts sub
      end
    end
    if exist
      formula = sub
      puts formula
    end

    @presta = []
    final = ActiveRecord::Base.connection.select_all("select name, speed, emp, anc, penalty, price, " + formula +" as formulas from form order by " + formula + "/price desc")
    final.each do |f|
      fusion = Fusion.new(f)
      @presta << fusion
    end
  end
end