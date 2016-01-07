require 'asciidoctor-pdf' unless defined? ::Asciidoctor::Pdf

module AsciidoctorPdfExtensions

  def layout_title_page doc
      # no title page
  end

  def layout_chapter_title node, title
    if node.id == "dedication" || node.id == "acknowledgements"
      layout_heading_custom title, align: :center
    elsif node.sectname == "colophon"
      puts 'Processing ' + node.sectname + '...'
      move_down 470
      layout_heading title, size: @theme.base_font_size
    elsif node.id.include? "chapter" #todo: change this to the keyword that identifies chapters in your book
      puts 'Processing ' + node.id + '...'
      move_down 120
      # set Akkurat font for all custom headings
      font 'Akkurat'
      layout_heading 'PART', align: :right, size: 120, color: [91, 54, 8, 13], style: :normal
      move_up 40

      #todo: change node.id to ids you've used for the different chapters of your mini-book
      part_number = "ONE"
      if node.id.include? "chapter-2"
        part_number = "TWO"
      elsif node.id.include? "chapter-3"
        part_number = "THREE"
      end

      layout_heading part_number, align: :right, size: 120, color: [42, 1, 83, 1], style: :bold
      layout_heading title, align: :right, color: [42, 1, 83, 1], style: :normal, size: 30
      move_up 30
      start_new_page
    else
       # delegate to default implementation
       super
    end
  end

  def layout_heading_custom string, opts = {}
      move_down 100
      typeset_text string, calc_line_metrics((opts.delete :line_height) || @theme.heading_line_height), {
          inline_format: true
      }.merge(opts)
      move_up 5
      $i = 0
      underline = ''
      while $i < string.length do
          if string == 'Dedication'
            underline += '/////'
          else
            underline += '//////'
          end
          $i += 1
      end
      if string == 'Dedication'
          underline += '////'
      end
      typeset_text underline, calc_line_metrics((opts.delete :line_height) || @theme.heading_line_height), {
            inline_format: true, color: 'B0B0B0', size: 8, style: :italic
      }.merge(opts)
      move_down 20
  end

end

Asciidoctor::Pdf::Converter.prepend AsciidoctorPdfExtensions
