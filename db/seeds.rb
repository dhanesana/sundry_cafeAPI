require 'open-uri'
require 'nokogiri'
require "google/api_client"
require "google_drive"

session = GoogleDrive.saved_session(ENV['GOOGLE'])
ws = session.spreadsheet_by_key(ENV['SPREADSHEET']).worksheets[0]

column = 2
row = 5 # Data starts on row 5
blank_counter = 0 # Counter for blank rows

loop do
  p row
  p '-' * 50
  break if blank_counter > 3
  blank_counter += 1 if ws[row, 2] == '' # Add to counter if row is blank

  kor_name = ws[row, 2]
  eng_name = ws[row, 3]
  daum_url = ''
  naver_url = ''
  daum_url += ws[row, 4] unless ws[row, 4].include? 'naver'
  naver_url += ws[row, 5] unless ws[row, 5].include? 'daum'

  ### DAUM ###
  if daum_url != '' && daum_url != 'none'
    page = Nokogiri::HTML(open(daum_url).read)
    link = "http://cafe.daum.net#{page.css('frame').first.attribute('src').text}"
    page_with_score = Nokogiri::HTML(open(link).read)
    score = page_with_score.css('span.num').first.text.gsub(/,/,"")

    @daum_cafe = Cafe.where(url: daum_url).first
    if @daum_cafe
      @daum_cafe.kor_name = kor_name
      @daum_cafe.eng_name = eng_name
      if @daum_cafe.save
        # update history
        @membership = Membership.new(cafe_id: @daum_cafe.id, count: score.to_i)
        if @membership.save
          blank_counter = 0
        else
          p '!' * 50
          p 'Update: HISTORY DID NOT SAVE'
          p @daum_cafe
          p '!' * 50
        end
      else
        p '!' * 50
        p 'DAUM DID NOT SAVE'
        p @daum_cafe
        p '!' * 50
      end
    else
      # create
      @new_cafe = Cafe.new(kor_name: kor_name, eng_name: eng_name, url: daum_url, cafe_type: 'daum')
      if @new_cafe.save
        # save history
        @new_membership = Membership.new(cafe_id: @new_cafe.id, count: score.to_i)
        if @new_membership.save
          blank_counter = 0
        else
          p '!' * 50
          p 'New: HISTORY DID NOT SAVE'
          p @new_cafe
          p '!' * 50
        end
      else
        p '!' * 50
        p 'DAUM DID NOT CREATE'
        p '!' * 50
      end
    end
  else
    # do nothing
  end

  ### NAVER ###
  if naver_url != '' && naver_url != 'none'
    page = Nokogiri::HTML(open(naver_url))
    score = page.css('em')[1].text.gsub(/,/,"")

    @naver_cafe = Cafe.where(url: naver_url).first
    if @naver_cafe
      @naver_cafe.kor_name = kor_name
      @naver_cafe.eng_name = eng_name
      if @naver_cafe.save
        # update history
        @membership = Membership.new(cafe_id: @naver_cafe.id, count: score.to_i)
        if @membership.save
          blank_counter = 0
        else
          p '!' * 50
          p 'Update: HISTORY DID NOT SAVE'
          p @naver_cafe
          p '!' * 50
        end
      else
        p '!' * 50
        p 'NAVER DID NOT SAVE'
        p @naver_cafe
        p '!' * 50
      end
    else
      # create
      @new_cafe = Cafe.new(kor_name: kor_name, eng_name: eng_name, url: naver_url, cafe_type: 'naver')
      if @new_cafe.save
        # save history
        @new_membership = Membership.new(cafe_id: @new_cafe.id, count: score.to_i)
        if @new_membership.save
          blank_counter = 0
        else
          p '!' * 50
          p 'New: HISTORY DID NOT SAVE'
          p @new_cafe
          p '!' * 50
        end
      else
        p '!' * 50
        p 'NAVER DID NOT CREATE'
        p '!' * 50
      end
    end
  else
    # do nothing
  end

  row += 1
end




