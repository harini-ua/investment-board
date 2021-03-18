import numeral from 'numeral'
import moment from 'moment'

export default {
  /**
   * Filter to convert the given value to percent.
   *
   * @param value
   * @param decimals
   * @returns {string}
   */
  percentage: ( value, decimals = 2 ) => {
    if (!value) value = 0
    if (!decimals) decimals = 0

    //value = value * 10 // TODO: Need test
    value = Math.round(value * Math.pow(10, decimals)) / Math.pow(10, decimals)
    value = value + '%'

    return value
  },

  /**
   * Filter to convert a slug to a more human-friendly form.
   *
   * @param value
   * @returns {string}
   */
  humanable: ( value ) => {
    var words = value.split(/[-_]+/g)
    var results = []
    for (var i = 0; i < words.length; i++) {
      var letter = words[i].charAt(0).toUpperCase()
      results.push(letter + words[i].slice(1))
    }

    return results.join(' ')
  },

  /**
   * Filter to truncate a string to the specified length.
   *
   * @param value
   * @param length
   * @returns {string|*}
   */
  truncate: ( value, length = 100 ) => {
    if (value.length < length) {
      return value
    }

    length = length - 3

    return value.substring(0, length) + '...'
  },

  /**
   * Filter to round the decimal to the given place.
   *
   * @param value
   * @param decimals
   * @returns {number}
   */
  round: ( value, decimals = 2 ) => {
    if (!value) value = 0

    if (!decimals) decimals = 0

    value = Math.round(value * Math.pow(10, decimals)) / Math.pow(10, decimals)

    return value
  },

  /**
   * Filter to format numbers
   *
   * @param value
   * @param format
   * @returns {*}
   */
  numeral: ( value, format = '0,0' ) => {
    return numeral(value).format(format).replace(/,/g, ' ')
  },

  /**
   * Filter to converts a number into a string
   *
   * @param value
   * @returns {string}
   */
  number_to_string: ( value ) => {
    return value.toLocaleString()
  },

  /**
   * Filter to converts a date into a string
   *
   * @param value
   * @param format
   * @returns {string}
   */
  date_format: ( value, format = 'MM/DD/YYYY' ) => {
    return moment(value).format(format)
  },

  /**
   * Filter to converts a negative numbers
   *
   * @param value
   * @returns {string}
   */
  is_negative: ( value ) => {
    return (Number.parseInt(value) < 0) ? '('+value.substring(1)+')' : value
  },

  /**
   * Filter to converts a price
   *
   * @param value
   * @returns {string}
   */
  price: ( value ) => {
    let val = (value/1).toFixed(2).replace('.', ',')
    return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')
  },
}
