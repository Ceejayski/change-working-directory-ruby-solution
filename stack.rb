def cmd(cd, pwd) # rubocop:disable Metrics/MethodLength
  arr1 = cd.split('/').reject(&:empty?)
  arr2 = pwd.split('/').reject(&:empty?)
  stack = []
  if pwd[0] == '/'
    stack << arr2.shift
  else
    stack = arr1
  end

  arr2.each do |args|
    if args == '..'
      stack.pop
    else
      stack << args
    end
  end

  "/#{stack.join('/')}".gsub('.', '').gsub('//', '/')
end

print cmd('/x/q', '/p/./q')
