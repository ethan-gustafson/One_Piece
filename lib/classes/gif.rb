class Gif

    def photos
    photos = 
    []
    end

    def loop
        c = 1
        while c < 54 do 
            system "clear"
            photos.each do |p|
                puts p 
                sleep(0.1)
                c += 1
            end
        end
    end


end